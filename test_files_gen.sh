#!/usr/bin/env bash

HEAD=$(cat <<-END
import React from 'react'
import { shallow } from 'enzyme'
import App from '../App'
import { sleep, defaultDuration } from '../tools'
jasmine.DEFAULT_TIMEOUT_INTERVAL = 500000;
END
)

TEST=$(cat <<-END
it('changes the text on click', () => {
  const wrapper = shallow(<App/>)
  let text = wrapper.find('.text-container')
  expect(text.exists()).toBe(true)
  expect(wrapper.state('words')).toBe('')
  wrapper.find('button').simulate('click')
  text = wrapper.find('.text-container')
  expect(text.text()).toBe(wrapper.state('words'))
})
END
)

for i in {0..500}
do
  echo "$HEAD" > "./src/tests/App$(printf "%03d" "$i").test.js"

  for l in {0..100}
  do
    echo "$TEST" >> "./src/tests/App$(printf "%03d" "$i").test.js"
  done
done

mkdir junit