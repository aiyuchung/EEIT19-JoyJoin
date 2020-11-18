package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ForumBean;

public interface ForumService {

	
	
	/**
	 * 條件查詢討論標題
	 * @param forumBean 查詢條件物件
	 * @return 查詢結果
	 */
    public List<ForumBean> selectForumTitleListByParam(ForumBean forumBean);
    

    public List<ForumBean> selectForumDteailListByParam(ForumBean forumBean);
    
	/**
	 * 增加點擊次數
	 * @param forumSeq 討論序號
	 * @return 點擊次數結果
	 */
    public Integer plusPopularity(int forumSeq);
    
	/**
	 * 根據Key值查詢單筆討論
	 * @param forumSeq 討論序號
	 * @return 指定討論
	 */
    public ForumBean selectOneForum(int forumSeq);
    
    public void createNewArticle(ForumBean forumBean);
    
    
    public List<ForumBean> saveOrUpdateArticle(ForumBean forumBean);
    
	
        
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
