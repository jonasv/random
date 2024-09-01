import yfinance as yf
import sys

def get_crypto_value(crypto_from, crypto_to='usd', amount=1.0):
    # Mapping of symbols to Yahoo Finance ticker symbols
    crypto_map = {
        'btc': 'BTC-USD',
        'ltc': 'LTC-USD',
        'xmr': 'XMR-USD',
        'usd': 'USD',
        'gbp': 'GBPUSD=X'
    }

    # Convert inputs to lowercase for consistency
    crypto_from = crypto_from.lower()
    crypto_to = crypto_to.lower()

    # Check if the inputs are valid
    if crypto_from not in crypto_map:
        print(f"Error: Unsupported 'from' cryptocurrency. Supported options are {list(crypto_map.keys())}.")
        return
    if crypto_to not in crypto_map:
        print(f"Error: Unsupported 'to' currency/cryptocurrency. Supported options are {list(crypto_map.keys())}.")
        return

    # Fetch the exchange rate for the 'from' cryptocurrency to USD
    ticker_from = yf.Ticker(crypto_map[crypto_from])
    data_from = ticker_from.history(period="1d")
    if data_from.empty:
        print(f"Error: Could not retrieve data for {crypto_from.upper()}.")
        return
    rate_from_usd = data_from['Close'].iloc[-1]

    if crypto_to == 'usd':
        exchange_rate = rate_from_usd
    elif crypto_to == 'gbp':
        # Fetch the USD to GBP conversion rate
        ticker_to = yf.Ticker(crypto_map[crypto_to])
        data_to = ticker_to.history(period="1d")
        if data_to.empty:
            print(f"Error: Could not retrieve data for {crypto_to.upper()}.")
            return
        usd_to_gbp_rate = data_to['Close'].iloc[-1]
        exchange_rate = rate_from_usd / usd_to_gbp_rate  # Corrected to divide by the USD to GBP rate
    else:
        # For cryptocurrency to cryptocurrency, get the target crypto's rate to USD
        ticker_to = yf.Ticker(crypto_map[crypto_to])
        data_to = ticker_to.history(period="1d")
        if data_to.empty:
            print(f"Error: Could not retrieve data for {crypto_to.upper()}.")
            return
        rate_to_usd = data_to['Close'].iloc[-1]
        exchange_rate = rate_from_usd / rate_to_usd

    equivalent_value = exchange_rate * amount

    print(f"The current exchange rate is 1 {crypto_from.upper()} = {exchange_rate} {crypto_to.upper()}.")
    print(f"{amount} {crypto_from.upper()} is equivalent to {equivalent_value} {crypto_to.upper()}.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <crypto_from> [crypto_to/currency] [amount]")
    else:
        crypto_from = sys.argv[1]
        crypto_to = sys.argv[2] if len(sys.argv) > 2 else 'usd'
        amount = float(sys.argv[3]) if len(sys.argv) > 3 else 1.0

        get_crypto_value(crypto_from, crypto_to, amount)
