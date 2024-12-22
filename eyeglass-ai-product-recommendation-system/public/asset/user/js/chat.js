// Hàm bật/tắt khung chat
function toggleChat() {
  // Cập nhật trạng thái
  isChatVisible = !isChatVisible;
  localStorage.setItem('isChatVisible', isChatVisible);
  showChat();
}

function showChat() {
  const inputField = document.querySelector('.input-container input');
  const messagesContainer = document.querySelector('.messages');
  const chatContainer = document.querySelector('.chat-container');
  isChatVisible = localStorage.getItem('isChatVisible') === 'true';
  console.log(isChatVisible);
  
  if (!isChatVisible) {
    chatContainer.className = 'chat-container chat-hidden'; // Ẩn khung chat
  } else {
    chatContainer.className = 'chat-container chat-visible'; // Hiện khung chat
    // focus vào ô nhập
    inputField.focus();
  }
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
}


showChat();


// Hàm gửi tin nhắn
function sendMessage(user_id) {
  const inputField = document.querySelector('.input-container input');

  const userMessage = inputField.value.trim();

  if (userMessage === '') return; // Không xử lý nếu tin nhắn rỗng
  addMessage(userMessage, "SEND");
  newMessage(userMessage, 'SEND', user_id);

  let url3 = "http://127.0.0.1:2712/recommend";
  $.ajax({
    url: url3,
    type: 'POST',
    contentType: 'application/json', // Thêm header Content-Type
    data: JSON.stringify({           // Stringify dữ liệu thành JSON
      "query": userMessage,
      "top_n": 3
    }),
    success: function (response) {
      console.log('Response:', response.text); // Nếu trả về text, bạn có thể truy cập ở đây
      let botMessage = response.text;

      if (response.recommendations) {
        console.log('Recommendations:', response.recommendations);
        let text = "Dưới đây có " + response.recommendations.length + " sản phẩm bạn có thể quan tâm: ";
        addMessage(text, "BOT");
        newMessage(text, 'BOT', user_id);

        for (let i = 0; i < response.recommendations.length; i++) {
          let product = response.recommendations[i];
          let product_id = product.id;
          let product_name = product.name;
          let product_price = product.price;
          let product_image = product.urlImage;

          text = product_name + ", giá " + product_price + " Đồng";
          addMessage(text, "BOT", product_image, product_id);
          newMessage(text, 'BOT', user_id, product_id);
        }
      } else {
        addMessage(botMessage, "BOT");
        newMessage(botMessage, 'BOT', user_id);
      }
    },
    error: function (xhr, status, error) {
      console.log('Error:', error);
    }
  });


  // Xóa nội dung ô nhập
  inputField.value = '';
}

function addMessage(message, type, url = null, product_id = 0) {
  const messagesContainer = document.querySelector('.messages');
  if (type == "SEND") {
    const userMessageElement = document.createElement('div');
    userMessageElement.classList.add('message');
    userMessageElement.innerHTML = `
    <div class="send">${message}</div>
  `;
    messagesContainer.appendChild(userMessageElement);
  } else {
    const botMessageElement = document.createElement('div');
    botMessageElement.classList.add('message');
    
    botMessageElement.innerHTML = `
        
        <img class="bot-avata" src="../asset/user/images/icons/bot.png" />
        <a href="http://127.0.0.1:8000/product/${product_id}" class="chat-mess">
        <div class="text">${message}</div>
        </a>`;
        if (product_id == 0) {
          botMessageElement.innerHTML = `
            <img class="bot-avata" src="../asset/user/images/icons/bot.png" />
            <div class="text">${message}</div>`;
        }
    messagesContainer.appendChild(botMessageElement);

    if (url) {
      const imageElement = document.createElement('div');
      imageElement.classList.add('message');
      imageElement.innerHTML = `
        <a href="http://127.0.0.1:8000/product/${product_id}">
        <img class="product-chat" src="http://127.0.0.1:8000/${url}" />
        </a>`;
      messagesContainer.appendChild(imageElement);
    }
  }
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

function newMessage(message, type, user_id, product_id = 0) {
  // Message chứa ký tự đặc biệt nên cần mã hóa
  message = encodeURIComponent(message);
  let url = 'http://127.0.0.1:8000/message/create/' + message + '/' + type + '/' + user_id + '/' + product_id;
  console.log(url);
  $.ajax({
    url: url,
    type: 'GET',
    success: function (response) {
      console.log('Response:', response);
    },
    error: function (xhr, status, error) {
      console.log('Error:', error);
    }
  });
}

function handleKeyDown(event, id) {
  if (event.key === 'Enter') {
    sendMessage(id); // Gửi tin nhắn khi nhấn Enter
  }
}

