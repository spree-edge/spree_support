// Function to handle file upload
function handleFileUpload(input) {
  const fileInfoContainer = $('#file-info').empty();

  for (const file of input.files) {
      // Create a new Image element
      const fileIcon = new Image();
      fileIcon.src = '/assets/backend-custom-file-icon.svg'; // Adjust the path as needed
      fileIcon.width = 40; // Set the width
      fileIcon.height = 40; // Set the height

      // Append the image and file name to the container
      fileInfoContainer.append(`<div class="file-uploaded d-flex align-items-center border py-2 px-3 rounded-lg mt-2"></div>`);
      fileInfoContainer.children().last().append(fileIcon);
      fileInfoContainer.children().last().append(`<p class="mb-0">${file.name}</p>`);
  }
}

// Use TurboLinks to execute code on page load
document.addEventListener('turbo:load', function() {
  // Get the file input element
  const fileInput = $('#attach-file');

  // Attach the onchange event handler using jQuery
  fileInput.on('change', function() {
    handleFileUpload(this);
  });
});
