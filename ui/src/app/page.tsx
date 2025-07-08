import Image from 'next/image';
import Link from 'next/link';
import styles from './page.module.css';

export default function Home() {
  return (
    <div className={styles.container}>
      <nav className={styles.navbar}>
        <span style={{ fontWeight: 700, fontSize: '1.2rem' }}>Transit Mesh</span>
        <div>
          <Link href="https://github.com/VinayKamte16/transit-mesh" target="_blank">GitHub</Link>
          <Link href="/docs" target="_blank">Docs</Link>
        </div>
      </nav>
      <section className={styles.hero}>
        <h1>Multi-Cloud Transit Mesh</h1>
        <p style={{ fontSize: '1.1rem', color: '#444' }}>
          Live showcase of a full-mesh, multi-cloud network automation and monitoring project.
        </p>
      </section>
      <div className={styles.cards}>
        <div className={styles.card}>
          <h2>Overview</h2>
          <ul>
            <li>Automates a full-mesh network between AWS, Azure, and GCP using Terraform</li>
            <li>Provisions AWS Transit Gateway, Azure Virtual WAN, and GCP Cloud Router + HA VPN</li>
            <li>Interconnects them with IPSec/BGP</li>
            <li>Monitors performance with iperf3, fping, and Grafana</li>
          </ul>
        </div>
        <div className={styles.card}>
          <h2>Architecture</h2>
          <Image src="/architecture.png" alt="Architecture Diagram" width={400} height={220} />
        </div>
        <div className={styles.card}>
          <h2>Sample Dashboard</h2>
          <Image src="/grafana_sample.png" alt="Sample Grafana Dashboard" width={400} height={220} />
        </div>
      </div>
      <div className={styles.card}>
        <h2>Quick Start</h2>
        <ol>
          <li>Clone the repo</li>
          <li>Follow the README for setup instructions</li>
        </ol>
        <p>
          <Link href="https://github.com/VinayKamte16/transit-mesh" target="_blank">View on GitHub</Link>
        </p>
      </div>
      <footer>
        <small>Deployed with <a href="https://vercel.com/" target="_blank" rel="noopener noreferrer">Vercel</a></small>
      </footer>
    </div>
  );
}
