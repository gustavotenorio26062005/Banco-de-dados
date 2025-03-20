
SELECT *
FROM tb_via v
inner join tb_montanha m on v.via_montanha_fk = m.mont_cod
WHERE m.mont_localizacao LIKE '%Pão%';

select v.via_nome,m.mont_localizacao,g.grau_descricao
from tb_via v
inner join tb_montanha m on v.via_montanha_fk = m.mont_cod
inner join tb_grau g on v.via_grau_fk = g.grau_cod
where via_grau_fk like 'iv';

select *
from tb_escalador;

select *
from tb_ocorrencia;

select *
from tb_escalada;

select esca_nome,b.escalada_cod,c.ocor_descricao
from tb_escalador a
left join tb_escalada b on a.esca_cod = b.escalada_escalador_fk
left join tb_ocorrencia c on b.escalada_cod = ocor_escalada_fk;

select mont_localizacao,mont_altura
from tb_montanha
order by mont_altura desc
limit 1;

select mont_localizacao,mont_altura
from tb_montanha
order by mont_altura asc
limit 1;

SELECT *
FROM tb_montanha
WHERE mont_altura = (SELECT MAX(mont_altura) FROM tb_montanha);

SELECT m.mont_localizacao, COUNT(v.via_montanha_fk) AS num_vias
FROM tb_montanha m
INNER JOIN tb_via v ON m.mont_cod = v.via_montanha_fk
GROUP BY m.mont_localizacao;

