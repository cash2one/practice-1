$(function () {
  $(window).scroll(function() {       
      if($(window).scrollTop()>= 100){
        $('#top').fadeIn(300); 
      }else{    
        $('#top').fadeOut(300);
      }  
  });
  $('#top').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);});
  $('input[name=status]').on('ifChecked', function(event){
    listsearch();
  });
});
function showFaq(){
  $('#Faq').fadeIn(300);
}
function toggleFaq(){
  $('#Faq').fadeToggle(300);
}
function hideFaq(){
  $('#Faq').fadeOut(500);
}
function listsearch()
{
  var types=['radio','checkbox'];
  var form = $('#formSearch');
  var url = form.attr('action');
  var inputs = new Array();
  var vals = new Array();
  var dataArr = new Array;
  var dataStr = "";
  form.find('input').each(function(){
    var input = $(this).attr('name');
    if (inputs.indexOf(input) == -1) {
      var type =$(this)[0].type;
      if (types.indexOf(type)==-1) {
        var v = $('input[name='+input+']').val();
      }else{
        var v = $('input[name='+input+']:checked').val();
      }
      if (v!=''&&v!=null) {
         inputs.push(input);
         vals.push(v);
      }
    }
  });
  if (inputs.length !=0) {
    for (var i = 0; i < inputs.length; i++) {
      var d = inputs[i] + "/" + vals[i];
      dataArr.push(d); 
    }
    url = url + "/" + dataArr.join("/");
    window.location.href = url;
  }else{
    window.location.href= url;
  }
}
