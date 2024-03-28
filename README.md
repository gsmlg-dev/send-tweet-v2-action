# Send Tweet V2 Action

Post a tweet using V2 API to Twitter during a GitHub Actions workflow.


## Inputs

| name                | required | type   | default         | description   |
| ------------------- | ---      | ------ | --------------- | ------------- |
| message             | yes      | string |                 | tweet content
| bearer-token        | yes      | string |                 | bearer-token
| consumer-key        | no       | string |                 | 
| consumer-secret     | no       | string |                 | 
| access-token        | no       | string |                 | 
| access-token-secret | no       | string |                 | 

## Example usage

Workflow:

```yml
name: Send tweet
on:
  schedule:
    - cron: '0 0 * * *' # every day at 00:00
  push:
    branches: [ main ]
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: gsmlg-dev/send-tweet-v2-action@v1
        with:
          bearer-token: ${{ secrets.TWITTER_BEARER_TOKEN }}
          consumer-key: ${{ secrets.TWITTER_CONSUMER_API_KEY }}
          consumer-secret: ${{ secrets.TWITTER_CONSUMER_API_SECRET }}
          access-token: ${{ secrets.TWITTER_ACCESS_TOKEN }}
          access-token-secret: ${{ secrets.TWITTER_ACCESS_TOKEN_SECRET }}
          message: |
            A new version of Package has been released.
