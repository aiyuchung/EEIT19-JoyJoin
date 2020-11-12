package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ForumBean;

public interface ForumService {

	
	
	//查詢討論標題清單
    public List<ForumBean> selectForumTitleList(ForumBean forumBean);
    
    //查詢討論熱門清單
    Map<String, Integer> updateHitCount(int forumSeq);
    
    //查詢討論活動類型
    public List<ForumBean> selectForumType();
    
    //查詢討論發文者
    public List<ForumBean> selectForumAuthor();
    
    //查詢討論地區
    public List<ForumBean> selectForumLocation();
    
    
    
    
//	/**
//	 * 建立一筆新的討論
//	 * @param forumBean 討論物件
//	 * @return 查詢新增結果
//	 */
//    public List<ForumBean> createForum(ForumBean forumBean);
//	
//	//更新討論
//    public ForumBean updateForum(int forumSeq,ForumBean forumBean);
//    
//    //更新討論(指定部分參數)
//    public ForumBean updateForumByParam(int forumSeq,ForumBean forumBean) ;
//	
//	//更新點擊量
//    public Integer updateHitCount(int forumSeq);
//	
//	//查詢單一討論內容
//    public ForumBean selectOneForum(int forumSeq);
	

}
