<script setup>
import { computed, ref } from 'vue'

const recursos = ['Salão de Festas', 'Churrasqueira', 'Quadra', 'Piscina', 'Espaço Gourmet']
const reservas = ref([
  { id: 1, recurso: 'Salão de Festas', data: '2026-10-10', inicio: '14:00', fim: '18:00', status: 'Confirmada' }
])
const form = ref({ recurso: '', data: '', inicio: '', fim: '', pessoas: 1 })
const mensagem = ref('')

const totalAtivas = computed(() => reservas.value.filter(r => r.status !== 'Cancelada').length)

function reservar() {
  mensagem.value = ''
  const f = form.value
  if (!f.recurso || !f.data || !f.inicio || !f.fim || !f.pessoas) {
    mensagem.value = 'Preencha todos os campos obrigatórios.'
    return
  }
  if (f.inicio >= f.fim) {
    mensagem.value = 'O horário final deve ser posterior ao horário inicial.'
    return
  }
  const conflito = reservas.value.some(r =>
    r.status !== 'Cancelada' && r.recurso === f.recurso && r.data === f.data &&
    f.inicio < r.fim && f.fim > r.inicio
  )
  if (conflito) {
    mensagem.value = 'Este recurso já possui uma reserva nesse intervalo.'
    return
  }
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
    <header class="topbar">
      <div>
        <p class="eyebrow">AREC • Copasul</p>
        <h1>Sistema de Gestão de Reservas</h1>
      </div>
      <span class="user">Área do associado</span>
    </header>

    <main>
      <section class="hero" aria-labelledby="boas-vindas">
        <div>
          <p class="eyebrow">Reserva digital</p>
          <h2 id="boas-vindas">Organize seu lazer de forma simples</h2>
          <p>Consulte recursos e solicite horários sem depender do controle manual de agendamentos.</p>
        </div>
        <div class="stats" aria-label="Resumo">
          <strong>{{ totalAtivas }}</strong><span>reservas ativas</span>
          <strong>{{ recursos.length }}</strong><span>recursos</span>
        </div>
      </section>

      <div class="grid">
        <section class="card" aria-labelledby="nova-reserva">
          <h2 id="nova-reserva">Nova reserva</h2>
          <form @submit.prevent="reservar">
            <label>Recurso
              <select v-model="form.recurso" required>
                <option value="">Selecione</option>
                <option v-for="recurso in recursos" :key="recurso">{{ recurso }}</option>
              </select>
            </label>
            <label>Data <input v-model="form.data" type="date" required></label>
            <div class="times">
              <label>Início <input v-model="form.inicio" type="time" required></label>
              <label>Término <input v-model="form.fim" type="time" required></label>
            </div>
            <label>Número de pessoas <input v-model.number="form.pessoas" type="number" min="1" max="500" required></label>
            <button type="submit">Solicitar reserva</button>
            <p v-if="mensagem" class="message" role="status">{{ mensagem }}</p>
          </form>
        </section>

        <section class="card" aria-labelledby="minhas-reservas">
          <h2 id="minhas-reservas">Minhas reservas</h2>
          <p v-if="!reservas.length">Nenhuma reserva cadastrada.</p>
          <article v-for="reserva in reservas" :key="reserva.id" class="reservation">
            <div>
              <h3>{{ reserva.recurso }}</h3>
              <p>{{ reserva.data }} • {{ reserva.inicio }}–{{ reserva.fim }}</p>
              <span class="status">{{ reserva.status }}</span>
            </div>
            <button v-if="reserva.status !== 'Cancelada'" class="secondary" @click="cancelar(reserva.id)">Cancelar</button>
          </article>
        </section>
      </div>
    </main>

    <footer>Projeto Integrador • UFMS Digital • 2026</footer>
  </div>
</template>
