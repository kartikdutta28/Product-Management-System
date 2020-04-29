<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script>
    showChecked();
    function showChecked(){
        document.getElementById("result").textContent = document.querySelectorAll("input:checked").length;
    }
    document.querySelectorAll("input[name=order]").forEach(i=>{
        i.onclick = function(){
        showChecked();
    }
    });
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
</script>
<script src="/js/bootstrap.min.js"></script><br/><br/>
<footer class="footer fixed-bottom py-3 bg-secondary text-center">
    <div class="container">
        <span class="text-white">Copyright Reserver &copy; 2020</span>
    </div>
</footer>