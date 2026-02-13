import { env } from "@/src/env";

export default function HomePage() {
  return (
    <main style={{ fontFamily: "system-ui", padding: "2rem" }}>
      <h1>Dexera Web</h1>
      <p>Environment: {env.NEXT_PUBLIC_APP_ENV}</p>
    </main>
  );
}
