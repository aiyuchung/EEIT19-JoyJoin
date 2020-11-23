package com.web.activity.annotation;

/*記錄資料庫相關的操作如：新建，更新，刪除。*/
import java.lang.annotation.*;

@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
	/** 要執行的操作型別比如：add操作 **/
	public String operationType() default "";

	/** 要執行的具體操作比如：新增使用者 **/
	public String operationName() default "";
}