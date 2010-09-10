/**
 * Copyright Université Lyon 1 / Université Lyon 2 (2009,2010)
 * 
 * <ithaca@liris.cnrs.fr>
 * 
 * This file is part of Visu.
 * 
 * This software is a computer program whose purpose is to provide an
 * enriched videoconference application.
 * 
 * Visu is a free software subjected to a double license.
 * You can redistribute it and/or modify since you respect the terms of either 
 * (at least one of the both license) :
 * - the GNU Lesser General Public License as published by the Free Software Foundation; 
 *   either version 3 of the License, or any later version. 
 * - the CeCILL-C as published by CeCILL; either version 2 of the License, or any later version.
 * 
 * -- GNU LGPL license
 * 
 * Visu is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * Visu is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Visu.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * -- CeCILL-C license
 * 
 * This software is governed by the CeCILL-C license under French law and
 * abiding by the rules of distribution of free software.  You can  use, 
 * modify and/ or redistribute the software under the terms of the CeCILL-C
 * license as circulated by CEA, CNRS and INRIA at the following URL
 * "http://www.cecill.info". 
 * 
 * As a counterpart to the access to the source code and  rights to copy,
 * modify and redistribute granted by the license, users are provided only
 * with a limited warranty  and the software's author,  the holder of the
 * economic rights,  and the successive licensors  have only  limited
 * liability. 
 * 
 * In this respect, the user's attention is drawn to the risks associated
 * with loading,  using,  modifying and/or developing or reproducing the
 * software by the user in light of its specific status of free software,
 * that may mean  that it is complicated to manipulate,  and  that  also
 * therefore means  that it is reserved for developers  and  experienced
 * professionals having in-depth computer knowledge. Users are therefore
 * encouraged to load and test the software's suitability as regards their
 * requirements in conditions enabling the security of their systems and/or 
 * data to be ensured and,  more generally, to use and operate it in the 
 * same conditions as regards security. 
 * 
 * The fact that you are presently reading this means that you have had
 * knowledge of the CeCILL-C license and that you accept its terms.
 * 
 * -- End of licenses
 */
package com.lyon2.visu.service.impl;

import java.util.List;

import javax.swing.Icon;

import org.red5.logging.Red5LoggerFactory;
import org.red5.server.api.IConnection;
import org.red5.server.api.Red5;
import org.slf4j.Logger;

import com.lyon2.utils.MailerFacade;
import com.lyon2.utils.UserAccountHelpers;
import com.lyon2.visu.domain.dao.UserDAO;
import com.lyon2.visu.domain.model.User;
import com.lyon2.visu.service.UserService;

public class UserServiceImpl implements UserService 
{
	
	private static Logger log = Red5LoggerFactory.getLogger(UserServiceImpl.class,"visu");
	private UserDAO userDao;	
	
	public User addUser(User user) 
	{
		User createdUser;
		
		log.debug("addUser {}", user);	
		try
		{ 
			
			
			user.setActivation_key( UserAccountHelpers.key(32) );
			createdUser = this.userDao.insert(user);
			/*
			String subject = "Creation de compte visu";
			String[] recipients = {user.getMail()};
			String sender = "lionel.breduillieard@univ-lyon2.fr";
			StringBuffer msg = new StringBuffer("Bonjour,\n veuillez activer votre commpte en cliquant sur le lien:");
			msg.append("http://localhost:5080/visu/activation");
			msg.append("?key="+createdUser.getActivation_key());
			msg.append("&uid="+createdUser.getId_user());
			
			MailerFacade.sendMail(subject, recipients, sender, msg.toString() );
			*/
			return createdUser;
		}
		catch (Exception e)
		{
			log.error("-- addUser : " + e.getMessage());
		}
		return null;
		
	}
	
	public Integer deleteUser(User user) 
	{
		log.debug("delete User {}",user );
		try
		{
			return this.userDao.delete(user);
		}
		catch (Exception e)
		{
			log.error("--deleteUser : " + e.getMessage());
		}
		return null;
	}
		
	public List<User> listUsers() 
	{
		log.debug("listUsers" );
		try
		{
			return this.userDao.getUsers();
		}
		catch (Exception e)
		{
			log.error("--listUsers : " + e.getMessage());
		}
		return null;
	}
	
	public List<User> getUsersFromSession(Integer sessionId)
	{
		log.debug("getUsersFromSession");
		try {
			return this.userDao.getUsersFromSession(sessionId);
		}
		catch (Exception e) {
			log.error("--getUsersFromSession : " + e.getMessage());		
		}
		return null;
	}
		
	public User updateUser(User user) 
	{
		log.debug("updateUser User {}", user );
		try
		{
			return this.userDao.update(user);
		}
		catch (Exception e)
		{
			log.error("--update : " + e.getMessage());
		}
		return null;
	}

	public User getUser(Integer userId)
	{
		log.debug("getUser userId {}", userId );
		try
		{
			return this.userDao.getUser(userId);
		}
		catch (Exception e)
		{
			log.error("--getUser : " + e.getMessage());
		}
		return null;
	}
		
	public UserDAO getUserDao() {
		return userDao;
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public User getUserByUsernamePassword(String username, String password) 
	{
		
		log.debug("getUserByUsernamePassword user {} - passs : ********", username, password );
		IConnection conn = Red5.getConnectionLocal();
		
		
		User u = (User) conn.getAttribute("user");
		if( u != null )
		{
			log.debug("user already authentified {}",u);
			return u;
		}
		else
		{
			log.debug("user is not authentified");
		}
		try
		{
			u = this.userDao.getUserByUsernamePassword(username,password);
			conn.setAttribute("user", u);
			log.debug("Save authentified user {}",u);
		}
		catch (Exception e)
		{
			log.error("--getUserByUsernamePassword : " + e.getMessage());
		}
		
		return u;
	}
	
	
}