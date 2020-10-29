(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, )
 */
$.extend($.validator.messages, {
	 required: "這是必填字串",
	    remote: "請修正此字串",
	    email: "請輸入有效email",
	    url: "請輸入有效網址",
	    date: "請輸入有效日期",
	    dateISO: "請輸入有效日期 (YYYY-MM-DD)",
	    number: "請輸入有效數字",
	    digits: "只能輸入數字",
	    creditcard: "請輸入有效信用卡號",
	    equalTo: "你的输入不相同",
	    extension: "请输入有效的后缀",
	    maxlength: $.validator.format("最多可以输入 {0} 个字符"),
	    minlength: $.validator.format("最少要输入 {0} 个字符"),
	    rangelength: $.validator.format("请输入长度在 {0} 到 {1} 之间的字符串"),
	    range: $.validator.format("请输入范围在 {0} 到 {1} 之间的数值"),
	    max: $.validator.format("请输入不大于 {0} 的数值"),
	    min: $.validator.format("请输入不小于 {0} 的数值")
});

}));