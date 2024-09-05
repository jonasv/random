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

    try:
        # Check if the inputs are valid
        if crypto_from not in crypto_map:
            raise ValueError(f"Unsupported 'from' cryptocurrency. Supported options are {list(crypto_map.keys())}.")
        if crypto_to not in crypto_map:
            raise ValueError(f"Unsupported 'to' currency/cryptocurrency. Supported options are {list(crypto_map.keys())}.")

        # Fetch the exchange rate for the 'from' cryptocurrency to USD
        ticker_from = yf.Ticker(crypto_map[crypto_from])
        data_from = ticker_from.history(period="1d")

        if data_from.empty:
            raise ValueError(f"No data found for {crypto_from.upper()}. The data might not be available or the ticker symbol may be incorrect.")

        rate_from_usd = data_from['Close'].iloc[-1]

        if crypto_to == 'usd':
            # Direct conversion to USD
            exchange_rate = rate_from_usd
            equivalent_value = rate_from_usd * amount
        else:
            # Fetch the exchange rate for the 'to' cryptocurrency to USD
            ticker_to = yf.Ticker(crypto_map[crypto_to])
            data_to = ticker_to.history(period="1d")

            if data_to.empty:
                raise ValueError(f"No data found for {crypto_to.upper()}. The data might not be available or the ticker symbol may be incorrect.")

            rate_to_usd = data_to['Close'].iloc[-1]

            if crypto_from == 'usd':
                # Conversion from USD to another cryptocurrency
                exchange_rate = 1 / rate_to_usd
            else:
                # Conversion from one cryptocurrency to another
                exchange_rate = rate_from_usd / rate_to_usd

            equivalent_value = exchange_rate * amount

        print(f"The current exchange rate is 1 {crypto_from.upper()} = {exchange_rate} {crypto_to.upper()}.")
        print(f"{amount} {crypto_from.upper()} is equivalent to {equivalent_value} {crypto_to.upper()}.")

    except ValueError as ve:
        print(f"ValueError: {ve}")
    except IndexError as ie:
        print(f"IndexError: No data available for the requested currency pair. Please check the symbol and try again.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

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
