
SELECT *
FROM tb_via v
inner join tb_montanha m on v.via_montanha_fk = m.mont_cod
WHERE m.mont_localizacao LIKE '%Pão%';

select *
from tb_via v
inner join tb_montanha m on v.via_montanha_fk = m.mont_cod
where via_grau_fk like 'iv';

select *
from tb_escalador;

select *
from tb_ocorrencia;

select *
from tb_escalada;

select *
from tb_escalador a
inner join tb_escalada b on a.esca_cod = b.escalada_escalador_fk
left join tb_ocorrencia c on b.escalada_cod = ocor_escalada_fk
order by cres;