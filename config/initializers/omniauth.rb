 OmniAuth.config.logger = Rails.logger
 Rails.application.config.middleware.use OmniAuth::Builder do
   provider :linkedin, '75gzfc0s2pynqq', 'q0AVOfi5NP24doqB'
 end

 OmniAuth.config.on_failure = Proc.new do |env|
  [302, {'Location' => "/", 'Content-Type'=> 'text/html'}, []]
end