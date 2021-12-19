FROM golang:1.17 as development


WORKDIR /app

COPY . /app

RUN go mod download

# Install Reflex for development
RUN go install github.com/cespare/reflex@latest

EXPOSE 8001

CMD reflex -r '\.go$$' -s go run server/*.go

# CMD ls -l; pwd; reflex -r '\.go$$' -s go run server/*.go
# CMD reflex -r '\.go$$' -s go run server/*.go


# CMD [ "/auth-service" ]
# FROM golang:1.17 as development

# # Add a work directory
# WORKDIR /app

# # Cache and install dependencies
# COPY go.mod .

# COPY go.sum .

# RUN go mod download

# # Copy app files
# COPY . .

# # Expose port
# EXPOSE 8001

# # RUN ls -l; cd server/; ls -l;
