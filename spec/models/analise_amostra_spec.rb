describe "AanaliseAmostra" do
    before(:each) do
      create_db
      migrate
    end
  
    after(:each) { drop_db }
  
    setup do 
        AMOSTRA = Amostra.find_or_create_by!(
        id: 20,
        owner_name: "1",
        cpf: nil,
        telefone: nil,
        property_name: "1",
        profundidade: nil,
        compactacao: nil,
        peso: 400,
        user_id: 1,
        created_at: Fri, 22 Jan 2021 14:29:27 UTC +00:00,
        updated_at: Mon, 22 Feb 2021 23:38:14 UTC +00:00,
        argila: 0.1e2,
        potassio: 0.11e2,
        calcario: 0.1e2,
        magnesio: 0.1e2,
        enxofre20: 0.1e1,
        enxofre40: 0.2e2,
        hidrogenio: 0.1e2,
        alcalinidade: 0.1e2,
        boro: 0.1e2,
        cobre: 0.1e2,
        manganes: 0.1e2,
        zinco: 0.1e2,
        carbono: 0.2e2,
        materia: nil,
        valor: nil,
        ctc: nil>,)
    
    end
    
    it "belongs to a User" do
      if defined?(User)
        user = User.new(email: "george@abitbol.me", password: "123456")
        user.save
        ownership = Ownership.new(name: "Le Wagon", url: "http://www.lewagon.com", user: user)
        post.save
  
        expect(Post.last.user).to eq(User.last)
      else
        raise "Fix the User tests before paying attention to this one"
      end
    end

    it "belongs to a Property" do
        if defined?(User)
          user = User.new(email: "george@abitbol.me", password: "123456")
          user.save
          ownership = Ownership.new(name: "Le Wagon", url: "http://www.lewagon.com", user: user)
          post.save
    
          expect(Post.last.user).to eq(User.last)
        else
          raise "Fix the User tests before paying attention to this one"
        end
      end
  
    
    
    it "Should save valid AnaliseAmostra Instance" do
      if defined?(User)
        user = User.new(username: "george", email: "george@abitbol.me")
        user.save
        post = Post.new(name: "Le Wagon", url: "http://www.lewagon.com", user: user)
        post.save
  
        expect(AnaliseAmostra.last.user_id).to eq(User.last)
      else
        raise "Fix the User tests before paying attention to this one"
      end
    end
  end
  