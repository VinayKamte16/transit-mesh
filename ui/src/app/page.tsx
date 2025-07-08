import Image from 'next/image';
import Link from 'next/link';

export default function Home() {
  return (
    <main style={{ maxWidth: 800, margin: '0 auto', padding: '2rem' }}>
      <h1>Multi-Cloud Transit Mesh</h1>
      <p>
        Welcome to the live showcase for the <b>Multi-Cloud Transit Mesh</b> project!
      </p>
      <h2>Overview</h2>
      <ul>
        <li>Automates a full-mesh network between AWS, Azure, and GCP using Terraform</li>
        <li>Provisions AWS Transit Gateway, Azure Virtual WAN, and GCP Cloud Router + HA VPN</li>
        <li>Interconnects them with IPSec/BGP</li>
        <li>Monitors performance with iperf3, fping, and Grafana</li>
      </ul>
      <h2>Architecture</h2>
      <Image src="/architecture.png" alt="Architecture Diagram" width={700} height={350} style={{ background: '#eee', borderRadius: 8 }} />
      <h2>Links</h2>
      <ul>
        <li><Link href="https://github.com/VinayKamte16/transit-mesh" target="_blank">GitHub Repository</Link></li>
        <li><Link href="/docs" target="_blank">Documentation</Link></li>
        <li><Link href="/grafana_sample.png" target="_blank">Sample Grafana Dashboard</Link></li>
      </ul>
      <h2>Quick Start</h2>
      <ol>
        <li>Clone the repo</li>
        <li>Follow the README for setup instructions</li>
      </ol>
      <footer style={{ marginTop: 40, color: '#888' }}>
        <small>Deployed with <a href="https://vercel.com/" target="_blank" rel="noopener noreferrer">Vercel</a></small>
      </footer>
    </main>
  );
}
