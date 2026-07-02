export default function Home() {
  return (
    <div className="space-y-8">
      <section className="text-center">
        <h1 className="text-4xl font-bold text-primary mb-4">Bem-vindo ao AREC</h1>
        <p className="text-lg text-gray-600 mb-6">
          Sistema de Gestão e Agendamento de Recursos Recreativos
        </p>
        <div className="space-x-4">
          <a
            href="/login"
            className="inline-block px-6 py-3 bg-primary text-white rounded-lg hover:bg-secondary transition"
          >
            Entrar
          </a>
          <a
            href="/register"
            className="inline-block px-6 py-3 border-2 border-primary text-primary rounded-lg hover:bg-blue-50 transition"
          >
            Registrar
          </a>
        </div>
      </section>

      <section className="grid md:grid-cols-3 gap-6 mt-12">
        <div className="p-6 bg-white rounded-lg shadow">
          <h3 className="text-xl font-semibold mb-2">✅ Reservas Fáceis</h3>
          <p className="text-gray-600">Faça suas reservas de forma rápida e segura</p>
        </div>
        <div className="p-6 bg-white rounded-lg shadow">
          <h3 className="text-xl font-semibold mb-2">📅 Calendário Inteligente</h3>
          <p className="text-gray-600">Visualize disponibilidades em tempo real</p>
        </div>
        <div className="p-6 bg-white rounded-lg shadow">
          <h3 className="text-xl font-semibold mb-2">🔔 Notificações</h3>
          <p className="text-gray-600">Receba atualizações sobre suas reservas</p>
        </div>
      </section>
    </div>
  );
}
