import $ from 'jquery';

const maskInput = () => {

  $(document).ready(function() {
    // $('.date').mask('00/00/0000');
    $('.phone_with_ddd').mask('(00) 00000-0000');
    $('.cpf').mask('000.000.000-00');
    $('.cnpj').mask('00.000.000/0000-00', {reverse: true});
  });
};

export { maskInput };
