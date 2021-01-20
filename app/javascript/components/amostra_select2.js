const select2ForAnaliseAmostra = () => {
    $(document).ready(function domReady() {
        $(".js-select2").select2({
            placeholder: "Pick states",
            theme: "material"
        });

        $(".select2-selection__arrow")
            .addClass("material-icons")
            .html("arrow_drop_down");
    });
}

console.log("Hello from /amostra_select2.js");
export { select2ForAnaliseAmostra };

