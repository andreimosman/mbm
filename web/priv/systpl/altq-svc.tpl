<loop name="servicos_altq"># {$servico}
{sem_up}class cbq {if_up} {altq_label} {altq_plabel} exactbandwidth {banda_up}{tipo_banda_up}
{sem_up}filter {if_up} {altq_label} 0 {porta} {alvo} 0 0
{sem_down}class cbq {if_down} {altq_label} {altq_plabel} exactbandwidth {banda_down}{tipo_banda_down}
{sem_down}filter {if_down} {altq_label} {alvo} 0 0 {porta} 0
</loop name="servicos_altq">


