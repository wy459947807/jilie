<div class="page"> 
    <div class="dataTables_wrapper">       
        <div class="dataTables_info"  role="status" aria-live="polite">显示 <!--{($data.page-1)*$data.pageLimit}--> 到 <!--{$data.page*$data.pageLimit}--> ，共 <!--{$data.num}--> 条</div>        
        <div class="dataTables_paginate paging_simple_numbers" >
            <!--{if $data.page>1}-->
            <a class="paginate_button previous disabled" onclick="jumpPage(<!--{$data.page-1}-->)"  href="javascript:void(0)">上一页</a>
            <!--{else}-->
            <a class="paginate_button previous disabled" onclick="jumpPage(1)" href="javascript:void(0)">上一页</a>
            <!--{/if}-->
            <span>
                <!--{$start=($data.page>5)?($data.page-5):1}-->
                <!--{section name=loop loop=10}-->
                <!--{$index=$smarty.section.loop.index}-->
                <!--{if ($start+$index-1)*$data.pageLimit<$data.num}-->
                    <a onclick="jumpPage(<!--{$start+$index}-->)" class="paginate_button <!--{if ($start+$index)==$data.page}-->} current <!--{/if}--> " href="javascript:void(0)"><!--{$start+$index}--></a>
                <!--{/if}-->
                <!--{/section}-->
            </span>
            <!--{if $data.page*$data.pageLimit>=$data.num}-->
            <a class="paginate_button next disabled" onclick="jumpPage(<!--{$data.page}-->)"   href="javascript:void(0)">下一页</a>
            <!--{else}-->
            <a class="paginate_button next disabled" onclick="jumpPage(<!--{$data.page+1}-->)" href="javascript:void(0)">下一页</a>
            <!--{/if}-->
        </div>
    </div>
</div> 
<script type="text/javascript" src="/lib/public/LG.js"></script>
<script>
    function jumpPage(page){
        var myurl=new LG.URL(window.location.href);
        myurl.set("page",page);
        //alert (myurl.url());
        window.location.href=myurl.url();
    }
</script>