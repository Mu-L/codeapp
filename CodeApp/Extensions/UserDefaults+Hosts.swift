//
//  UserDefaults+Hosts.swift
//  Code
//
//  Created by Ken Chung on 1/5/2022.
//

import Foundation

extension UserDefaults {
    var remoteHosts: [RemoteHost] {
        get {
            if let data = self.data(forKey: "remote.hosts"),
                let array = try? PropertyListDecoder().decode([RemoteHost].self, from: data)
            {
                return array
            } else {
                return []
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                self.set(data, forKey: "remote.hosts")
            }
        }
    }
    var gitCredentialsLookupEntries: [GitCredentials] {
        get {
            if let data = self.data(forKey: "git.credentials.entries"),
                let array = try? PropertyListDecoder().decode(
                    [GitCredentials].self, from: data)
            {
                return array
            } else {
                return []
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                self.set(data, forKey: "git.credentials.entries")
            }
        }
    }
}
