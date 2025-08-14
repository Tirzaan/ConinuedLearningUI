// Lesson 23
//
//  SwiftUISubcriber.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/11/25.
//

import SwiftUI
import Combine

/// Lesson 23 - Shows how to use Publishers and Subcribers in a view model
class SubcriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        setupTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { (text) -> Bool in
                if text.count >= 3 {
                    return true
                }
                return false
            }
//            .assign(to: \.textIsValid, on: self) (not using because self is not weak)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setupTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
//                if self.count >= 10 {
//                    for item in self.cancellables {
//                        item.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
    
}

struct SwiftUISubcriber: View {
    
    @StateObject var viewModel = SubcriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(viewModel.textIsValid.description)
            
            TextField("Type Something here...", text: $viewModel.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    HStack {
                        Spacer()
                        ZStack {
                            Image(systemName: "xmark")
                                .foregroundStyle(.red)
                                .opacity(
                                    viewModel.textFieldText.count < 1 ? 0 :
                                    viewModel.textIsValid ? 0 : 1)
                            
                            Image(systemName: "checkmark")
                                .foregroundStyle(.green)
                                .opacity(viewModel.textIsValid ? 1 : 0)
                        }
                        .font(.title)
                        .padding(.trailing)
                    }
                }
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .opacity(viewModel.showButton ? 1 : 0.5)
            }
            .disabled(!viewModel.showButton)

        }
        .padding()
    }
}

#Preview {
    SwiftUISubcriber()
}
