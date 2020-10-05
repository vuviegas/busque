import $ from 'jquery';

const clickTableRow = () => {
  // document.addEventListener("DOMContentLoaded", () => {
  //   const rows = document.querySelectorAll("tr[data-href]");

  //   rows.forEach(row => {
  //     row.addEventListener("click", () => {
  //       window.location.href = row.dataset.href;
  //     });
  //   });
  // });

  $("tr[data-link]").click(function() {
    if (!event.target.classList.contains("fa-trash-alt")) {
      window.location = $(this).data("link")
    };
  });

  $("tr[data-link]").css('cursor', 'pointer');
};

export{ clickTableRow };
