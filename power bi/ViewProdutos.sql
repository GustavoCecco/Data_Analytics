CREATE VIEW V_Produtos AS 

SELECT
p.IDProduto,
p.Produto as NomeProduto,
p.ImagemProduto,
p.Marca,
p.Preco,
p.Segmento,
c.Categoria as NomeCategoria,
c.Imagemcategoria
from Produto p
left join Categoria c on p.IDCategoria = c.IDCategoria