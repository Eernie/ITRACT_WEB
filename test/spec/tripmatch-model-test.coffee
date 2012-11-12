describe "Test suite for the tripmatch model", -> 
	beforeEach ->
        this.model = new shuttledriveWeb.Models.TripMatchesModel
        this.model2 = new shuttledriveWeb.Models.TripMatchesModel id: 1 	

    ###  Checking the variables  ###    
    describe "Setting and checking the variables", ->    	
    	describe "Check if variables are undefined", ->
    		it "Check if origin address is empty/undefined", ->
    			expect(this.model.originAddress).toBeUndefined
    			expect(this.model.originAddress).toNotEqual ''

    		it "Check if destination address is empty/undefined", ->
    			expect(this.model.destinationAddress).toBeUndefined
    			expect(this.model.destinationAddress).toNotEqual ''

    	describe "Test setting the variables", ->
	    	it "Test setting the origin address", ->
	    		this.model.originAddress = "Groningen"
	    		expect(this.model.originAddress).toBe "Groningen"

	    	it "Test setting the destination address", ->
    			this.model.destinationAddress = "Zwolle"	
    			expect(this.model.destinationAddress).toBe "Zwolle"


	    describe "Check if variables are defined", ->
    		it "Check if origin address is defined", ->
    			expect(this.model.originAddress).toBeDefined

    		it "Check if destination address is defined", ->
    			expect(this.model.destinationAddress).toBeDefined

    ###  Checking the URL  ###
    describe "Checking the URL", ->
        describe "Checking the settings of the URL", ->
            it "URL check", ->
                expect(shuttledriveWeb.rootPath).toBe 'http://localhost:5000'

            it "the variable 'id' has to be undefined", ->
                expect(this.model.id).toBe undefined 

            it "Setting the id", ->
                expect(this.model2.id).toEqual 1
                expect(this.model2.id).toNotEqual 2 
        
        describe "Checking for a response from the server", ->
            it "Checking if origin- and destinationAddress is correct with match id 0", ->
                model = new shuttledriveWeb.Models.TripMatchesModel id: 1
                originAddress = null
                destinationAddress = null
                runs ->
                    model.fetch
                        success: ->
                            originAddress = model.attributes.tripMatches[0].offerOriginAddress
                            destinationAddress = model.attributes.tripMatches[0].offerDestinationAddress
                            
                waitsFor ->
                    originAddress
                    destinationAddress

                runs ->
                    expect(originAddress).toEqual 'Groningen' 
                    expect(destinationAddress).toEqual 'Zwolle'  

            it "Checking if origin- and destinationAddress is correct with match id 1", ->
                model = new shuttledriveWeb.Models.TripMatchesModel id: 1
                originAddress = null
                destinationAddress = null
                runs ->
                    model.fetch
                        success: ->
                            originAddress = model.attributes.tripMatches[1].offerOriginAddress
                            destinationAddress = model.attributes.tripMatches[1].offerDestinationAddress
                            
                waitsFor ->
                    originAddress
                    destinationAddress

                runs ->
                    expect(originAddress).toEqual 'Baflo' 
                    expect(destinationAddress).toEqual 'Zwolle'             