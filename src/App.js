import './App.scss';
import { Provider } from 'react-redux';

import Header from './components/header/Header';
import store from './redux/store';

const App = () => {
  return (
    <Provider store={store}>
      <Header />
      <div className="app">
        <h1>Redux</h1>
      </div>
    </Provider>
  );
};

export default App;
