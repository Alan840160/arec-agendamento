<script setup>
defineProps({ reservas: { type: Array, required: true } })
const emit = defineEmits(['cancelar'])
</script>

<template>
  <section class="card" aria-labelledby="minhas-reservas">
    <h2 id="minhas-reservas">Minhas reservas</h2>
    <p v-if="!reservas.length">Nenhuma reserva cadastrada.</p>
    <article v-for="reserva in reservas" :key="reserva.id" class="reservation">
      <div>
        <h3>{{ reserva.recurso }}</h3>
        <p><time :datetime="reserva.data">{{ reserva.data }}</time> • {{ reserva.inicio }}–{{ reserva.fim }}</p>
        <span class="status">{{ reserva.status }}</span>
      </div>
      <button v-if="reserva.status !== 'Cancelada'" class="secondary" type="button" @click="emit('cancelar', reserva.id)">Cancelar</button>
    </article>
  </section>
</template>
