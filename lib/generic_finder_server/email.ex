defmodule GenericFinderServer.Email do
    defmodule Certification do
        def cert do
            #이메일 받기
            email_address = "tngh147258@gmail.com"
            {:ok, pid} = Gmail.User.start_mail(
                email_address, 
                "1//04aAvs_BHZP_OCgYIARAAGAQSNwF-L9IrOjZediXwr0u5KdNxBOdWrECc4d1IPEgnc0HVmKpfOJWHi6_HMn33B81gNL4p57V3Avc"
            )

            {:ok, messages} = Gmail.User.messages(email_address, %{})
            IO.puts messages
        end
    end
end