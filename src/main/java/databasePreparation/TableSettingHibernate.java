package databasePreparation;

/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.CustomerBean;


public class TableSettingHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
//			
//			// 1. 由"data/bookCompany.dat"逐筆讀入BookCompany表格內的初始資料，
//			// 然後依序新增到BookCompany表格中
//			try (
//				FileReader fr = new FileReader("data/client.dat"); 
//				BufferedReader br = new BufferedReader(fr);
//			) {
//				while ((line = br.readLine()) != null) {
//					if (line.startsWith(UTF8_BOM)) {
//						line = line.substring(1);
//					}
//					String[] token = line.split(",");
//					String loginId = token[0];
//					String password = token[1];
//					String name = token[2];
//					String nickName = token[3];
//					String gender = token[4];
//					String tel = token[5];
//					String birthYear = token[6];
//					String birthMon = token[7];
//					String interest = token[8];
//					String level = token[9];
//					String authority = token[10];
//					
//					
//					CustomerBean cb = new 
//							CustomerBean(null, loginId, password, name, nickName, gender, tel, birthYear, birthMon, interest, level, authority);
//					session.save(cb);
//				}
//			} catch (IOException e) {
//				System.err.println("新建BookCompany表格時發生IO例外: " + e.getMessage());
//			}
//			session.flush();
//			System.out.println("BookCompany 資料新增成功");

//			File file = new File("data/book.dat");
			// 2. 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
			// 到Book表格中
//			try (
//				FileInputStream fis = new FileInputStream(file);
//				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
//				BufferedReader br = new BufferedReader(isr);
//			) {
//				while ((line = br.readLine()) != null) {
//					System.out.println("line=" + line);
//					// 去除 UTF8_BOM: \uFEFF
//					if (line.startsWith(UTF8_BOM)) {
//						line = line.substring(1);
//					}
//					String[] token = line.split("\\|");
//					BookBean book = new BookBean();
//					book.setTitle(token[0]);
//					book.setAuthor(token[1]);
//					book.setPrice(Double.parseDouble(token[2].trim()));
//					book.setDiscount(Double.parseDouble(token[3].trim()));
//					// book.setCompanyId(Integer.parseInt(token[4].trim()));
//					int companyId = Integer.parseInt(token[4].trim());
//					CompanyBean cb = session.get(CompanyBean.class, companyId);
//					book.setCompanyBean(cb);
//					// 讀取圖片檔
//					Blob blob = SystemUtils2018.fileToBlob(token[5].trim());
//					book.setCoverImage(blob);
//					book.setFileName(SystemUtils2018.extractFileName(token[5].trim()));
//					book.setBookNo(token[6].trim());
//					book.setStock(Integer.parseInt(token[7].trim()));
//					book.setCategory(token[8].trim());
//					session.save(book);
//					System.out.println("新增一筆Book紀錄成功");
//				}
//				// 印出資料新增成功的訊息
//				session.flush();
//				System.out.println("Book資料新增成功");
//			}

			// 3. Member表格
			// 由"data/Input.txt"逐筆讀入Member表格內的初始資料，
			// 然後依序新增到Member表格中
			try (
				FileInputStream fis = new FileInputStream("data/client.csv");
				InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr0);
			) {
				while ((line = br.readLine()) != null) {
					
					String[] sa = line.split(",");
					CustomerBean bean = new CustomerBean();
//					bean.setId(Integer.parseInt(sa[0].trim()));
					bean.setLoginId(sa[1].trim());
					String pswd = GlobalService.getMD5Endocing(GlobalService.encryptString(sa[2]));
					bean.setPassword(pswd);
					bean.setUserName(sa[3]);
					bean.setNickname(sa[4]);
					bean.setGender(sa[5]);
					bean.setEmail(sa[6]);
					bean.setTel(sa[7]);
					bean.setBirthYear(Integer.parseInt(sa[8]));
					bean.setBirthMon(Integer.parseInt(sa[9]));
					bean.setInterest(sa[10]);
					bean.setLevel(Integer.parseInt(sa[11]));
					bean.setAuthority(sa[12]);
					bean.setStatus(sa[13]);
					
					
					// --------------處理Blob(圖片)欄位----------------
//					Blob sb = SystemUtils2018.fileToBlob(sa[8]);
//					bean.setMemberPic(sb);
//					String imageFileName = sa[8].substring(sa[8].lastIndexOf("/") + 1);
//					bean.setFileName(imageFileName);
//					Clob clob = SystemUtils2018.fileToClob(sa[9]);
//					bean.setComment(clob);
//					bean.setUnpaid_amount(0.0);
					session.save(bean);
					count++;
					System.out.println("新增" + count + "筆記錄:" + sa[1]);
				}
				session.flush();
				System.out.println("Member表格資料新增成功");
				

			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			//活動大類Activity Type
			try (
					FileInputStream fis = new FileInputStream("data/ActivityType.csv");
					InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
					BufferedReader br = new BufferedReader(isr0);
				) {
					while ((line = br.readLine()) != null) {
						
						String[] sa = line.split(",");
						ActivityTypeBean atb = new ActivityTypeBean();
						atb.setActivityType(sa[0]);
						atb.setActivityTypeName(sa[1]);
						session.save(atb);
					}
					session.flush();
					System.out.println("活動大類的表格資料新增成功");
					

				} catch (Exception ex) {
					ex.printStackTrace();
				}
			
			
			//活動類型 Activity Class
			try (
					FileInputStream fis = new FileInputStream("data/ActivityType&Class.csv");
					InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
					BufferedReader br = new BufferedReader(isr0);
				) {
					while ((line = br.readLine()) != null) {
						
						String[] sa = line.split(",");
						ActivityClassBean acb = new ActivityClassBean();
						String activityType = sa[0];
						ActivityTypeBean atb = (ActivityTypeBean) session.get(ActivityTypeBean.class, activityType);
						acb.setActivityTypeBean(atb);
						
						acb.setActivityClassNo(sa[2]);
						acb.setActivityClass(sa[3]);
						session.save(acb);
					}
					session.flush();
					System.out.println("活動大類的表格資料新增成功");
					

				} catch (Exception ex) {
					ex.printStackTrace();
				}
			
			//activityBean

			try (
					FileInputStream fis = new FileInputStream("data/activity lists.csv");
					InputStreamReader isr = new InputStreamReader(fis, "UTF8");
					BufferedReader br = new BufferedReader(isr);
				) {
					while ((line = br.readLine()) != null) {
						System.out.println("line=" + line);
						// 去除 UTF8_BOM: \uFEFF
						if (line.startsWith(UTF8_BOM)) {
//							line = line.substring(1);
						}
						String[] token = line.split(",");
						ActivityBean tb = new ActivityBean();
//						tb.setActivityNo(Integer.parseInt(token[0]));
//						tb.setActivityType(token[0]);
						String activityType = token[0];
						ActivityTypeBean atb = (ActivityTypeBean) session.get(ActivityTypeBean.class, activityType);
						tb.setActivityTypeBean(atb);
						tb.setActivityTypeName(token[1]);						
//						tb.setActivityClassNo(token[2]);
						String activityClassNo = token[2];
						ActivityClassBean acb = (ActivityClassBean) session.get(ActivityClassBean.class, activityClassNo);
						tb.setActivityClassBean(acb);
						
						tb.setActivityClass(token[3]);
						tb.setLocation(token[4]);
						tb.setProv(token[5]);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
								Date date1 = sdf.parse(token[6]);
								java.sql.Date sqlDate1 = new java.sql.Date(date1.getTime());
						tb.setCreatedDate(sqlDate1);
						tb.setName(token[7]);
						
						Date date2 = sdf.parse(token[8]);
						java.sql.Date sqlDate2 = new java.sql.Date(date2.getTime());
						tb.setActivityDate(sqlDate2);
						tb.setMeetTime(token[9]);
						tb.setMeetPoint(token[10]);
						Date date3 = sdf.parse(token[11]);
						java.sql.Date sqlDate3 = new java.sql.Date(date3.getTime());
						tb.setFinalDate(sqlDate3);
						tb.setMaxLimit(token[12]);
						tb.setMinLimit(Integer.valueOf(token[13].trim()));
						tb.setPrice(Integer.valueOf(token[14].trim()));
						tb.setIntroduction(token[15]);
						
						tb.setActivityStatus(token[17]);
						
						if(token[18].equals("")) {
							token[18] =String.valueOf(0);
						}
						tb.setLeftDays(Integer.parseInt(token[18]));
						
						// book.setCompanyId(Integer.parseInt(token[4].trim()));
						int userId = Integer.parseInt(token[19].trim());
						CustomerBean cb = (CustomerBean) session.get(CustomerBean.class, userId);
						tb.setCustomerBean(cb);
						// 讀取圖片檔
//						Blob blob = SystemUtils2018.fileToBlob(token[5].trim());
//						book.setCoverImage(blob);
//						book.setFileName(SystemUtils2018.extractFileName(token[5].trim()));
//						book.setBookNo(token[6].trim());
//						book.setStock(Integer.parseInt(token[7].trim()));
//						book.setCategory(token[8].trim());
						session.save(tb);
						System.out.println("新增一筆活動紀錄成功");
					}
					// 印出資料新增成功的訊息
					session.flush();
					System.out.println("所有活動資料新增成功");
				}catch (Exception ex) {
					ex.printStackTrace();
				}
			
			
            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
        factory.close();
	}

}