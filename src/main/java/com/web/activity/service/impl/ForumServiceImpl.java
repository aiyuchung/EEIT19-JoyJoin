package com.web.activity.service.impl;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.web.activity.Enum.ForumType;
import com.web.activity.dao.ActivityDao;
import com.web.activity.dao.ForumDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.ForumBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.ForumService;

@Transactional
@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao forumDao;
	
	@Autowired
	ActivityDao activityDao;

	@Autowired
	ActivityService activityService;

	// 查詢討論標題清單
	public List<ForumBean> selectForumTitleListByParam(ForumBean forumBean) {
		forumBean.setForumType(ForumType.TITLE);
		return forumDao.selectAllForumByParam(forumBean);
	}

	// 查詢討論內容清單
	public List<ForumBean> selectForumDteailListByParam(ForumBean forumBean) {
		// forumBean.setForumType(ForumType.DETAIL);
		// forumBean.setCode(String.valueOf(forumBean.getForumSeq()));
		forumBean.setForumSeq(null);
		return forumDao.selectAllForumByParam(forumBean);
	}

	@Override
	public Integer plusPopularity(int forumSeq) {
		Integer hit = forumDao.plusPopularity(forumSeq);
		return hit;
	}

	@Override
	public ForumBean selectOneForum(int forumSeq) {
		ForumBean forumBean = forumDao.selectOneForum(forumSeq);
		return forumBean;
	}

	@Override
	public void createNewArticle(ForumBean forumBean) {
		forumBean.setForumType(ForumType.DETAIL);
		forumBean.setPopularity(0);
		forumDao.createForum(forumBean);
	}

	@Override
	public Integer createForumTitle(Integer activityNo) {
		ActivityBean activeBean = activityService.selectOneActivity(activityNo);
		MemberBean memberBean = activeBean.getMemberBean();
		ForumBean forumBean = new ForumBean(); // 邏輯上需要設定 forumBean.setActivityCode(activeBean.toString());
		forumBean.setActivityCode(activityNo.toString());
		forumBean.setType(activeBean.getActivityTypeName());
		forumBean.setTitle(activeBean.getName());
		forumBean.setLocation(activeBean.getProv());
		forumBean.setAuthor(memberBean.getMemberNo().toString());
		forumBean.setForumType(ForumType.TITLE);
		forumBean.setPopularity(0);
		forumBean.setScore(BigDecimal.ZERO); // 呼叫寫入討論的DAO
		Integer forumSeq = forumDao.createForum(forumBean);
		forumBean.setCode(forumSeq.toString());
		forumDao.updateForum(forumSeq, forumBean);
		return forumSeq;
	}

	@Override
	public List<ForumBean> saveOrUpdateArticle(ForumBean forumBean ,RoleBean rb) {
		if (forumBean.getPictures() != null &&  "Y".equals(forumBean.getPicUpdFlag())) {
			Blob blob1 = this.handlePictures(forumBean.getPictures()[0]);
			Blob blob2 = null;
			if (forumBean.getPictures().length > 1) {
				blob2 = this.handlePictures(forumBean.getPictures()[1]);
			}

			if (blob1 != null) {
				forumBean.setPhoto(blob1);
			}
			if (blob2 != null) {
				forumBean.setPhoto2(blob2);
			}
		}
		// 如果沒有key值，進行新增文章
		List<ForumBean> resultList = new ArrayList<ForumBean>();
		if (forumBean.getForumSeq() == null) {
			forumDao.updateRoleEmp(rb);
			this.createNewArticle(forumBean);
		} else {
			// 若已存在key值，則進行文章更新
			forumBean.setForumType(ForumType.DETAIL);
			if (forumBean.getScore() == null) {
				forumBean.setScore(BigDecimal.ZERO);
			}
			//如果沒有進行圖片調整(PicUpdFlag = N)，就取DB原本的值，不進行更新
			if ("N".equals(forumBean.getPicUpdFlag())) {
				ForumBean dbForum = forumDao.selectOneForum(forumBean.getForumSeq());
				forumBean.setPhoto(dbForum.getPhoto());
				forumBean.setPhoto2(dbForum.getPhoto2());
			}
			forumDao.updateForum(forumBean.getForumSeq(), forumBean);
		}
		ForumBean queryForum = new ForumBean();
		queryForum.setCode(forumBean.getCode());
		resultList = this.selectForumDteailListByParam(queryForum);
		// 更新TITLE的平均分數
		this.updateScore(resultList);
		return resultList;
	}

	private void updateScore(List<ForumBean> forumList) {
		ForumBean forumBean = forumList.stream().filter(f -> ForumType.TITLE.equals(f.getForumType())).findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream().sorted(Comparator.comparing(ForumBean::getForumSeq))
				.filter(f -> ForumType.DETAIL.equals(f.getForumType())).collect(Collectors.toList());
		BigDecimal averageNumber = forumDetailList.stream().map(ForumBean::getScore).reduce(BigDecimal::add)
				.orElse(BigDecimal.ZERO).divide(new BigDecimal(forumDetailList.size()), 1, RoundingMode.CEILING);

		
		forumBean.setScore(averageNumber);
		forumDao.updateForum(forumBean.getForumSeq(), forumBean);
		String stno= forumBean.getActivityCode();
		ActivityBean activity = activityDao.selectOneActivity(Integer.parseInt(stno));
		activity.setScore((averageNumber));
		activityDao.saveActivityScore(activity);
	}

	private Blob handlePictures(MultipartFile mFile) {
		Blob blob = null;
		if (mFile != null && !mFile.isEmpty()) {
			byte[] b;
			try {
				b = mFile.getBytes();
				blob = new SerialBlob(b);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("異常:" + e.getMessage());
			}
		}
		return blob;
	}

	@Override
	public Integer selectByActivityNo(int activityNo) {
		ForumBean bean = forumDao.selectByActivityNo(activityNo);
		System.out.println("service bean:" + bean);
		Integer forumSeq = bean.getForumSeq();
		System.out.println("service forumSeq:" + forumSeq);
		return forumSeq;
	}



}
