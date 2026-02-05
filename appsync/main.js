import { Amplify } from 'aws-amplify';
import config from './aws-exports.js';
import gql from 'graphql-tag';

Amplify.configure(config);

const query = gql`
query listMyAppsyncs {
  listMyAppsyncs {
    items {
      pk
      fruit
      level
    }
  }
}
`

async function fetchData() {
    try {
        const data = await Amplify.graphql({ query: query });
        console.log('Data:', data);
    } catch (error) {
        console.error('Error fetching todos:', error);
    }
}

fetchData();