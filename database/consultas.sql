USE crios_x_plus;

SELECT
    a.fecha_hora,
    n.nombre AS nodo,
    a.tipo_evento,
    a.porcentaje_confianza,
    a.nivel_riesgo
FROM alerta a
INNER JOIN nodo_iot n
    ON a.id_nodo = n.id_nodo
WHERE a.tipo_evento = 'Granizo'
ORDER BY a.fecha_hora DESC;


SELECT
    n.nombre AS nodo,
    a.tipo_evento,
    a.porcentaje_confianza,
    ac.tipo_accion,
    ac.estado_malla,
    ac.fecha_hora
FROM actuacion ac
INNER JOIN alerta a
    ON ac.id_alerta = a.id_alerta
INNER JOIN nodo_iot n
    ON a.id_nodo = n.id_nodo
WHERE ac.estado_malla = 'Desplegada'
ORDER BY ac.fecha_hora DESC;