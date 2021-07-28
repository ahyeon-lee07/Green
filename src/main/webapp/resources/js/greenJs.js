//스크롤 이벤트
/*document.addEventListener('scroll', function() {
    //현 높이
    var scrollHeight = document.documentElement.scrollTop;

    if(scrollHeight >= 120) {
        document.getElementById("gnbBox").classList.add("headerF");
        document.getElementById("header").classList.add("headerF");
        document.getElementById("logoBox").classList.add("headerFH");
       
    }else {
        document.getElementById("gnbBox").classList.remove("headerF");
        document.getElementById("header").classList.remove("headerF");
        document.getElementById("logoBox").classList.remove("headerFH");
    }

});*/

function ComSubmit(opt_formId) {// 값이 안들어오면 commonForm
   
   this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
   this.url = "";  //아이디가 없다면 form id를 commonForm으로쓴다
   
   if(this.formId == "commonForm") {//아이디가 commonForm이면
      $("#commonForm").empty();
   }
   
   this.setUrl = function setUrl(url) {
      this.url = url;
   };
   
   this.addParam = function addParam(key, value) {
      $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
                              // 히든으로 값을 설정함
   };
   
   this.submit = function submit() {
      var frm = $("#"+this.formId)[0];
      frm.action = this.url; //전송할 url
      frm.method = "post"; //전송할 방식
      frm.submit(); //전송
   };
   
}