<?php

/////////////////////////////////////////
// Configurações inicias da aplicação! //
/////////////////////////////////////////
require '_config.php';

///////////////////////////////////////
// Configurações iniciais da página! //
///////////////////////////////////////

/*
$titulo --> Define o título "desta" página.
Se = "", usa o título e o slogan do site.
 */
$titulo = "Artigos";

/*
$css --> Carrega o CSS adicional "desta" página.
Se "", não carrega CSS adicional.
Exemplo: /css/template.css
 */
$css = "/css/artigos.css";

/*
$js --> Carrega o JavaScript adicional "desta" página.
Se "", não usa JavaScript adicional.
Exemplo: /js/template.js
 */
$js = "";

/*
$menu --> Define o item ativo do menu "nesta" página.
Se "", nenhum item será marcado.
Valores possíveis: "", "artigos", "contatos", "sobre", "procurar", "noticias".
Qualquer outro valor = "".
 */
$menu = "artigos";

/////////////////////////////////////////////////////
// Seus códigos PHP para esta página começam aqui! //
/////////////////////////////////////////////////////

// Query de consulta ao banco de dados
$sql = "SELECT id_artigo, titulo, imagem, resumo FROM artigos WHERE status = 'ativo' ORDER BY data DESC";

// Executa a query
$res = $conn->query($sql);

// Declara variável que exibe os artigos
$artigos = '';

// Loop para obter cada registro do banco de dados
while ($art = $res->fetch_assoc()) {

    // Cria a lista de artigos usando HEREDOC
    $artigos .= <<<HTML

<div class="artigo">

    <a href="artigo.php?id={$art['id_artigo']}"><img src="{$art['imagem']}" alt="{$art['titulo']}"></a>
    <a href="artigo.php?id={$art['id_artigo']}"><h4>{$art['titulo']}</h4></a>
    <span>{$art['resumo']}</span>
    <small><a href="artigo.php?id={$art['id_artigo']}">Ler mais...</a></small>

</div>

HTML;

}

//////////////////////////////////////////////////////
// Seus códigos PHP para esta página terminam aqui! //
// Teoricamente, não precisa alterar nada abaixo!   //
//////////////////////////////////////////////////////

// Template de abertura - cabeçalho
require '_header.php';

?>

<h2>Artigos Recentes</h2>
<small class="subtitulo">Mais recentes primeiro.</small>

<div class="row">

    <div class="col1"><?php echo $artigos ?></div>
    <aside class="col2">
        <h3>Categorias</h3>
  <?php  
// tentativa de puxar o bando de dado para colocar os registros da tabela categoria

 //   $sql = "SELECT nome FROM categorias";
 //   $resource = $conn->query($sql);
 //   $categoria = '';
 //   while ($cat = $resource->fetch_assoc()) {
 //       $categoria .= <<<HTML
 //HTML;
//}
 ?>
        <ul>
            <li><a href="artigo.php?c={id_categoria}">{nome}</a><sup>{art_cat}</sup></li>
            <li><a href="artigos.php?c={id_categoria}">{Nome da categoria}</a></li>
            <li><a href="artigos.php?c={id_categoria}">{Nome da categoria}</a></li>
            <li>...</li>
        </ul>

   </aside>

    <!-- estava tentando fechar o php aqui  -->
  
   
</div>

<?php

// Template de fechamento - rodapé
require '_footer.php';

?>