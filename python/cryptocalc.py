import yfinance as yf
import sys
import requests

# Fetch data from CoinGecko as a fallback
def get_data_from_coingecko(crypto_from, crypto_to):
    """Fetches exchange rates from CoinGecko as a fallback."""
    url = f'https://api.coingecko.com/api/v3/simple/price?ids={crypto_from}&vs_currencies={crypto_to}'

    try:
        response = requests.get(url)
        data = response.json()

        # Check if the data contains the correct currency
        if crypto_from in data and crypto_to in data[crypto_from]:
            return data[crypto_from][crypto_to]
        else:
            raise ValueError(f"CoinGecko Error: Invalid data for {crypto_from} to {crypto_to}.")
    except Exception as e:
        print(f"Error fetching data from CoinGecko: {e}")
        return None

def get_crypto_value(crypto_from, crypto_to='usd', amount=1.0):
    """Gets crypto conversion rate from Yahoo Finance or falls back to CoinGecko."""
    crypto_map = {
        'btc': 'bitcoin',
        'ltc': 'litecoin',
        'xmr': 'monero',
        'usd': 'usd',
        'gbp': 'gbp'
    }

    # Convert inputs to lowercase for consistency
    crypto_from = crypto_from.lower()
    crypto_to = crypto_to.lower()

    try:
        # Try to fetch data from Yahoo Finance
        yf_ticker_from = f"{crypto_from.upper()}-USD" if crypto_from != 'usd' else 'USD'
        yf_ticker_to = f"{crypto_to.upper()}-USD" if crypto_to != 'usd' else 'USD'

        ticker_from = yf.Ticker(yf_ticker_from)
        data_from = ticker_from.history(period="1d")

        if not data_from.empty:
            rate_from_usd = data_from['Close'].iloc[-1]
            if crypto_to == 'usd':
                exchange_rate = rate_from_usd
                equivalent_value = rate_from_usd * amount
            else:
                ticker_to = yf.Ticker(yf_ticker_to)
                data_to = ticker_to.history(period="1d")
                if data_to.empty:
                    raise ValueError("Yahoo Finance failed to retrieve the target currency data.")
                rate_to_usd = data_to['Close'].iloc[-1]
                exchange_rate = rate_from_usd / rate_to_usd
                equivalent_value = exchange_rate * amount
            print(f"The current exchange rate is 1 {crypto_from.upper()} = {exchange_rate} {crypto_to.upper()}.")
            print(f"{amount} {crypto_from.upper()} is equivalent to {equivalent_value} {crypto_to.upper()}.")
        else:
            raise ValueError("Yahoo Finance failed to retrieve the source currency data.")

    except Exception as e:
        print(f"Yahoo Finance Error: {e}. Switching to CoinGecko as fallback...")

        # Try to fetch data from CoinGecko
        if crypto_from in crypto_map and crypto_to in crypto_map:
            exchange_rate = get_data_from_coingecko(crypto_map[crypto_from], crypto_map[crypto_to])
            if exchange_rate is not None:
                equivalent_value = exchange_rate * amount
                print(f"CoinGecko Fallback: The current exchange rate is 1 {crypto_from.upper()} = {exchange_rate} {crypto_to.upper()}.")
                print(f"{amount} {crypto_from.upper()} is equivalent to {equivalent_value} {crypto_to.upper()}.")
            else:
                print(f"Failed to fetch data for {crypto_from.upper()} to {crypto_to.upper()} from both Yahoo Finance and CoinGecko.")
        else:
            print(f"Error: Unsupported currency conversion between {crypto_from.upper()} and {crypto_to.upper()}.")

if __name__ == "__main__":
    try:
        if len(sys.argv) < 2:
            raise ValueError("Usage: python script.py <crypto_from> [crypto_to/currency] [amount]")
        else:
            crypto_from = sys.argv[1]
            crypto_to = sys.argv[2] if len(sys.argv) > 2 else 'usd'
            amount = float(sys.argv[3]) if len(sys.argv) > 3 else 1.0

            get_crypto_value(crypto_from, crypto_to, amount)

    except ValueError as ve:
        print(f"ValueError: {ve}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

