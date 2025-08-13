.github/workflows/update-rss.yml
name: Update RSS from Sheet

on:
  schedule:
    - cron: '0 8 * * *'      # Runs daily at 08:00 UTC

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Fetch RSS from Sheet
        run: |
          curl -o mantras.xml 'AKfycbx3m_eAm47FVHOxaNvmnkD8TMr51wZ3mvZU7TLV_Ps'

      - name: Commit & Push RSS
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          git config user.name 'github-actions'
          git config user.email 'actions@github.com'
          git add mantras.xml
          git commit -m 'Automated RSS update'
          git push
