# size: 10 <= size < 100
regexp=\s+(\d{2}|\d(?:[,.]?\d+)?[K])(?=\s[A-Z][a-z]{2}\s)
colours=bold yellow
=======
# size: 100 <= size < 1k
regexp=\s+(\d{3}|\d(?:[,.]?\d+)?[K])(?=\s[A-Z][a-z]{2}\s)
colours=red
=======
# size: 1k <= size < 10k
regexp=\s+(\d{4}|\d(?:[,.]?\d+)?[K])(?=\s[A-Z][a-z]{2}\s)
colours=bold red
=======
# size: 10k <= size < 100k
regexp=\s+(\d{5}|\d+(?:[,.]?\d+)?[K])(?=\s[A-Z][a-z]{2}\s)
colours=green
=======
# size: 100k <= size < 1M
regexp=\s+(\d{6}|\d+(?:[,.]?\d+)?[K])(?=\s[A-Z][a-z]{2}\s)
colours=bold green
=======
# size: 1M <= size < 10M
regexp=\s+(\d{7}|\d(?:[,.]?\d+)?[KM])(?=\s[A-Z][a-z]{2}\s)
colours=yellow
=======
