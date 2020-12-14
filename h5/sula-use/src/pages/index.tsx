// pages/index.tsx
import React from 'react';
import styles from './index.less';
import { CreateForm } from 'sula';

export default () => {
  const config = {
    fields: [
      {
        name: 'name',
        label: 'Name',
        field: 'input',
      },
    ],
    submit: {
      url: 'https://www.mocky.io/v2/5ed7a8b63200001ad9274ab5',
      method: 'POST',
    }
  }
  return <CreateForm {...config} />
}

