package com.api.automation;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("getRequest").relativeTo(getClass());
    }    

}
