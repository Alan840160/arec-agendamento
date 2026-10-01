<script setup>
import { computed, ref } from 'vue'
import AppHeader from './components/AppHeader.vue'
import ReservationForm from './components/ReservationForm.vue'
import ReservationList from './components/ReservationList.vue'

const recursos = ['Salão de Festas', 'Churrasqueira', 'Quadra', 'Piscina', 'Espaço Gourmet']
const reservas = ref([{ id: 1, recurso: 'Salão de Festas', data: '2026-10-10', inicio: '14:00', fim: '18:00', status: 'Confirmada' }])
const form = ref({ recurso: '', data: '', inicio: '', fim: '', pessoas: 1 })
const mensagem = ref('')
const totalAtivas = computed(() => reservas.value.filter(r => r.status !== 'Cancelada').length)

function reservar() {
  mensagem.value = ''
  const f = form.value
  if (!f.recurso || !f.data || !f.inicio || !f.fim || !f.pessoas) return mensagem.value = 'Preencha todos os campos obrigatórios.'
  if (f.inicio >= f.fim) return mensagem.value = 'O horário final deve ser posterior ao horário inicial.'
  const conflito = reservas.value.some(r => r.status !== 'Cancelada' && r.recurso === f.recurso && r.data === f.data && f.inicio < r.fim && f.fim > r.inicio)
  if (conflito) return mensagem.value = 'Este recurso já possui uma reserva nesse intervalo.'
  reservas.value.push({ id: Date.now(), ...f, status: 'Pendente' })
  mensagem.value = 'Reserva solicitada com sucesso.'
  form.value = { recurso: '', data: '', inicio: '', fim: '', pessoas: 1 }
}
function cancelar(id) {
  const reserva = reservas.value.find(r => r.id === id)
  if (reserva) reserva.status = 'Cancelada'
}
</script>

<template>
  <div class="page">
    <AppHeader />
    <main>
      <section class="hero" aria-labelledby="boas-vindas">
        <div><p class="eyebrow">Reserva digital</p><h2 id="boas-vindas">Organize seu lazer de forma simples</h2><p>Consulte recursos e solicite horários sem depender do controle manual de agendamentos.</p></div>
        <div class="stats" aria-label="Resumo"><strong>{{ totalAtivas }}</strong><span>reservas ativas</span><strong>{{ recursos.length }}</strong><span>recursos</span></div>
      </section>
      <div class="grid">
        <ReservationForm v-model="form" :recursos="recursos" :mensagem="mensagem" @reservar="reservar" />
        <ReservationList :reservas="reservas" @cancelar="cancelar" />
      </div>
    </main>
    <footer>Projeto Integrador • UFMS Digital • 2026</footer>
  </div>
</template>
