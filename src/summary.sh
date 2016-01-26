#!/bin/bash

if [ $? -ne "0" ]
then
    fail "Composer installed failed"
else
    success "Composer installed completed successfully!"
fi
