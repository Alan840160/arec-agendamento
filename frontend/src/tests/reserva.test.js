import { describe, expect, it } from 'vitest'

function horarioValido(inicio, fim) {
  return inicio < fim
}

function existeConflito(reservas, novaReserva) {
  return reservas.some(reserva =>
    reserva.status !== 'Cancelada' &&
    reserva.recurso === novaReserva.recurso &&
    reserva.data === novaReserva.data &&
    novaReserva.inicio < reserva.fim &&
    novaReserva.fim > reserva.inicio
  )
}

function quantidadePessoasValida(pessoas) {
  return pessoas >= 1 && pessoas <= 500
}

describe('Regras de reserva do Sistema AREC', () => {
  it('aceita horário final posterior ao horário inicial', () => {
    expect(horarioValido('14:00', '16:00')).toBe(true)
  })

  it('rejeita horário final anterior ao horário inicial', () => {
    expect(horarioValido('18:00', '16:00')).toBe(false)
  })

  it('detecta conflito de horário para o mesmo recurso e data', () => {
    const reservas = [
      {
        recurso: 'Churrasqueira',
        data: '2026-10-11',
        inicio: '14:00',
        fim: '20:00',
        status: 'Pendente'
      }
    ]

    const novaReserva = {
      recurso: 'Churrasqueira',
      data: '2026-10-11',
      inicio: '15:00',
      fim: '17:00'
    }

    expect(existeConflito(reservas, novaReserva)).toBe(true)
  })

  it('não considera reserva cancelada como conflito', () => {
    const reservas = [
      {
        recurso: 'Churrasqueira',
        data: '2026-10-11',
        inicio: '14:00',
        fim: '20:00',
        status: 'Cancelada'
      }
    ]

    const novaReserva = {
      recurso: 'Churrasqueira',
      data: '2026-10-11',
      inicio: '15:00',
      fim: '17:00'
    }

    expect(existeConflito(reservas, novaReserva)).toBe(false)
  })

  it('aceita quantidade válida de pessoas', () => {
    expect(quantidadePessoasValida(2)).toBe(true)
  })

  it('rejeita reserva com zero pessoas', () => {
    expect(quantidadePessoasValida(0)).toBe(false)
  })
})
