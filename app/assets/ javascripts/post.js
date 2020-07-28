$(function(){
  let tabs = $(".tab");
  
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    $(".show").removeClass("show");
    const index = tabs.index(this);
    $(".panel").removeClass("show").eq(index).addClass("show");
  }
  
  tabs.click(tabSwitch);

});